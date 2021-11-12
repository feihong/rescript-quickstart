type utterance
type voice = {name: string, lang: string}

// This doesn't work in Google Chrome on Linux
// @scope("speechSynthesis") @val external onVoicesChanged: (unit => unit) => unit = "onvoiceschanged"

@scope("speechSynthesis") @val external getVoices: unit => array<voice> = "getVoices"

@scope("speechSynthesis") @val
external addEventListener: (string, unit => unit) => unit = "addEventListener"

let onVoicesReady = callback => {
  let voices = getVoices()
  // Immediately available on FF
  if voices->Array.length > 0 {
    callback(voices)
  } else {
    // Voices have to be downloaded on Chrome
    addEventListener("voiceschanged", () => {
      let voices = getVoices()
      if voices->Array.length > 0 {
        callback(voices)
      }
    })
  }
}

@scope("speechSynthesis") @val external speak: utterance => unit = "speak"

@scope("speechSynthesis") @val external cancel: unit => unit = "cancel"

@new external makeUtterance: string => utterance = "SpeechSynthesisUtterance"

@set external setVoice: (utterance, voice) => unit = "voice"
@set external setPitch: (utterance, float) => unit = "pitch" // 0-2
@set external setRate: (utterance, float) => unit = "rate" // 0.1-10
