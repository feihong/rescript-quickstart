module Speech = {
  type speechSynthesis
  type utterance
  type voice = {name: string, lang: string}

  @val @scope("window") external synth: speechSynthesis = "speechSynthesis"

  @send external getVoices: speechSynthesis => array<voice> = "getVoices"

  let voices = synth->getVoices

  @new external makeUtterance: string => utterance = "SpeechSynthesisUtterance"

  @set external setVoice: (utterance, voice) => unit = "voice"

  @send external speak': (speechSynthesis, utterance) => unit = "speak"

  let speak = utterance => synth->speak'(utterance)
}

let litany = `I must not fear.
Fear is the mind-killer.
Fear is the little-death that brings total obliteration.
I will face my fear.
I will permit it to pass over me and through me.
And when it has gone past, I will turn the inner eye to see its path.
Where the fear has gone there will be nothing. Only I will remain.`

@react.component
let make = () => {
  let (voice, setVoice) = React.useState(() => Speech.voices->Array.getExn(0))
  let (text, setText) = React.useState(() => litany)

  <div>
    <Select value=voice isEqual={(a, b) => a.name == b.name} onChange={v => setVoice(_ => v)}>
      {Speech.voices
      ->Array.map(voice =>
        <Select.Item key=voice.name label={`${voice.name} (${voice.lang})`} value=voice />
      )
      ->RR.array}
    </Select>
    <Button
      onClick={_ => {
        let utterance = Speech.makeUtterance(text)
        utterance->Speech.setVoice(voice)
        utterance->Speech.speak
      }}>
      {"Speak"->RR.s}
    </Button>
    <div>
      <textarea
        rows=7
        cols=60
        value=text
        onChange={evt => setText(_ => ReactEvent.Form.currentTarget(evt)["value"])}
      />
    </div>
  </div>
}
