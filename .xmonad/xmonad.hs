import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Actions.KeyRemap
import qualified XMonad.StackSet as W
import XMonad.Util.SpawnOnce

import qualified Data.Map as M
import Data.Monoid

import System.Environment
import System.Exit

main = do
  spawn "xmobar"
  xmonad $ additionalKeysR [] $ docks config
    where config = def { terminal    = myTerminal
                       , layoutHook  = myDefaultLayout
                       , modMask     = myModMask
                       , borderWidth = 0
                       , startupHook = myStartupHook
                       , keys        = myKeys
                       }

myTerminal = "alacritty"
myModMask = mod4Mask
myDefaultLayout = avoidStruts layout
  where layout = Full ||| tiled ||| Mirror tiled
        tiled = Tall nmaster ratioDelta ratio
        nmaster = 1
        ratioDelta = 3/100
        ratio = 1/2
myDmenu = "dmenu_run -fn 'JetBrains Mono-11'"
myTextEditor = "emacsclient -c -a emacs"
myBrowser = "google-chrome-stable"

myStartupHook = do
  spawnOnce "emacs --daemon &"

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm,               xK_Return), spawn $ terminal conf)
    , ((modm,               xK_x     ), spawn myDmenu)
    , ((modm,               xK_e     ), spawn myTextEditor)
    , ((modm,               xK_b     ), spawn myBrowser)
    , ((modm,               xK_q     ), kill)
    , ((modm,               xK_space ), sendMessage NextLayout)
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
    , ((modm,               xK_o     ), refresh)
    , ((modm,               xK_Tab   ), windows W.focusDown)
    , ((modm .|. shiftMask, xK_Tab   ), windows W.focusUp)
    , ((modm,               xK_m     ), windows W.focusMaster  )
    , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
    , ((modm,               xK_h     ), sendMessage Shrink)
    , ((modm,               xK_l     ), sendMessage Expand)
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    , ((modm              , xK_s     ), sendMessage ToggleStruts)
    , ((modm .|. shiftMask, xK_backslash), io (exitWith ExitSuccess))
    , ((modm .|. shiftMask, xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    -- ++
    -- [ ((controlMask,               xK_n), spawn "xdotool key Down")
    -- , ((controlMask,               xK_p), spawn "xdotool key Up")]

emacsKeymap :: KeymapTable
emacsKeymap = KeymapTable [((controlMask, xK_p), (0, xK_Up)),
                           ((controlMask, xK_n), (0, xK_Down))]

additionalKeysR = flip additionalKeysP
