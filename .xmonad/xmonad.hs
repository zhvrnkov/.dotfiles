import XMonad
import XMonad.Hooks.ManageDocks
import System.Environment
import qualified Data.Map.Internal as DMI

main = do
  spawn "xmobar"
  xmonad $ docks config
    where config = def { terminal    = myTerminal
                       , layoutHook  = myDefaultLayout
                       , modMask     = myModMask
                       , borderWidth = 0
                       }

myTerminal = "alacritty"
myModMask = mod4Mask
myDefaultLayout = avoidStruts layout
  where layout = Full ||| tiled ||| Mirror tiled
        tiled = Tall nmaster ratioDelta ratio
        nmaster = 1
        ratioDelta = 3/100
        ratio = 1/2
-- myKeys :: XConfig Layout -> DMI.Map (XMonad.ButtomMask, KeySym) (X ())
myKeys = undefined
