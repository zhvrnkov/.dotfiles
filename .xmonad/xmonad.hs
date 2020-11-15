import XMonad
import System.Environment
import qualified Data.Map.Internal as DMI

main = xmonad def
     { terminal           = myTerminal
     , layoutHook         = myDefaultLayout
     , modMask            = myModMask
     , borderWidth        = 0
--     , keys               = myKeys
     }

myTerminal = "alacritty"
myModMask = mod4Mask
myDefaultLayout = Full
-- myKeys :: XConfig Layout -> DMI.Map (XMonad.ButtomMask, KeySym) (X ())
myKeys = undefined


data DefTest = DefText { string :: String
                       , int    :: Integer
                       }
               deriving Show

instance Default DefTest where
  def = DefText { string = "foo"
                , int    = 0
                }
