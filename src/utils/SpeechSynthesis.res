type utterance
type voice = {name: string, lang: string}

// This doesn't work in Google Chrome on Linux
// @scope("speechSynthesis") @val external onVoicesChanged: (unit => unit) => unit = "onvoiceschanged"

@scope("speechSynthesis") @val external getVoices: unit => array<voice> = "getVoices"

@scope("speechSynthesis") @val
external addEventListener: (string, unit => unit) => unit = "addEventListener"

let onVoicesReady = callback =>
  addEventListener("voiceschanged", () => {
    let voices = getVoices()
    if voices->Array.length > 0 {
      callback(voices)
    }
  })

@scope("speechSynthesis") @val external speak: utterance => unit = "speak"

@scope("speechSynthesis") @val external cancel: unit => unit = "cancel"

@new external makeUtterance: string => utterance = "SpeechSynthesisUtterance"

@set external setVoice: (utterance, voice) => unit = "voice"
