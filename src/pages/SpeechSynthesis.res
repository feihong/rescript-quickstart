type speechSynthesis

@val @scope("window") external speechSynthesis: speechSynthesis = "speechSynthesis"

type voice = {name: string, lang: string}

@send external getVoices: speechSynthesis => array<voice> = "getVoices"

let voices = speechSynthesis->getVoices

@react.component
let make = () =>
  <div>
    {voices
    ->Array.map(voice => <div key=voice.name> {`${voice.name} (${voice.lang})`->RR.s} </div>)
    ->RR.array}
  </div>
