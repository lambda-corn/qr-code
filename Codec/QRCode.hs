module Codec.QRCode
    (
      encode
    , Mode
    , Version
    , Payload
    ) where

import qualified Data.ByteString as BS

data Mode = Numeric
          | Alphanumeric
          | Binary
          | Kanji

data ErrorCorrectionLevel = L | M | Q | H

newtype Version = Version Int

newtype Payload = Payload BS.ByteString

data QRCode = QRCode Version ErrorCorrectionLevel Mode Payload

encode :: Version -> ErrorCorrectionLevel -> BS.ByteString -> QRCode
encode version eclevel payload = QRCode version eclevel Binary (Payload payload)

