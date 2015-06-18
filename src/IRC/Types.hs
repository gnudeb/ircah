module IRC.Types where

import Data.Text (Text)
import qualified IRC.Raw.Types as Raw

data Command a = Command (Raw.Message -> Maybe (IO a))

type Channel = Text
type Nick    = Text
type Message = Text
type Account = Text
type Target  = Text

data Mode = Plus  Char
          | Minus Char
    deriving (Show,Eq)
data CMode = CMode Nick Mode
    deriving (Show,Eq)
data User = User Nick
    deriving (Show,Eq)
    
data SASLCfg = SASLCfg {
     sasl_username :: String
    ,sasl_password :: String
} deriving (Show,Eq)

data ChannelCfg = ChannelCfg {
     channel_name     :: String
    ,channel_password :: Maybe String
} deriving (Show,Eq)
    
data Config = Config {
     config_network  :: String
    ,config_port     :: Int
    ,config_nick     :: String
    ,config_sasl     :: Maybe SASLCfg
    ,config_channels :: [ChannelCfg]
} deriving (Show,Eq)