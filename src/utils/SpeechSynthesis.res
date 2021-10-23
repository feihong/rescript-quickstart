type utterance
type voice = {name: string, lang: string}

@scope("speechSynthesis") @val external getVoices: unit => array<voice> = "getVoices"
let voices = getVoices()

@scope("speechSynthesis") @val external speak: utterance => unit = "speak"

@scope("speechSynthesis") @val external cancel: unit => unit = "cancel"

@new external makeUtterance: string => utterance = "SpeechSynthesisUtterance"

@set external setVoice: (utterance, voice) => unit = "voice"
