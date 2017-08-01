import Control.ST
import Data.Bits

record DecoderState where
    constructor MkDecoderState
    byteIndex : Int
    buffer : String

indexB64 : String -> Int -> Bits 64
indexB64 s i = intToBits $ fromInteger $ cast $ ord $ strIndex s i

startDecode : String -> STrans m Var res (\lbl => (lbl ::: State DecoderState) :: res)
startDecode buf = new $ MkDecoderState 0 buf

decDropNone : Var -> Resources -> Maybe (Bits 64) -> Resources
decDropNone _dec res Nothing = res
decDropNone dec res (Just _) = (dec ::: State DecoderState) :: res

getByte : (dec : Var) -> STrans m (Maybe (Bits 64))
    ((dec ::: State DecoderState) :: res)
    (decDropNone dec res)
getByte dec = do
    state <- read dec
    if length (buffer state) <= toNat (byteIndex state)
        then do
            delete dec
            pure Nothing
        else do
            write dec (record { byteIndex $= (+1) } state)
            let byte = buffer state `indexB64` byteIndex state
            pure (Just byte)


getVInt' : Nat -> (dec : Var) -> STrans m (Maybe (Bits 64))
    ((dec ::: State DecoderState) :: res)
    (decDropNone dec res)
getVInt' Z _ = pure (Just (intToBits 0))
getVInt' (S k) dec = case !(getByte dec) of
    Nothing => pure Nothing
    Just byte =>
        if byte < intToBits 128
           then pure (Just byte)
           else do case !(getVInt' k dec) of
                          Nothing => pure Nothing
                          Just rest => pure $ Just $
                               (byte `and` intToBits 127) `or` (rest `shiftLeft` intToBits 7)

getVInt : (dec : Var) -> STrans m (Maybe (Bits 64))
    ((dec ::: State DecoderState) :: res)
    (decDropNone dec res)
getVInt = getVInt' 8
