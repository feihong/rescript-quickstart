module Speech = SpeechSynthesis

let litany = `I must not fear.
Fear is the mind-killer.
Fear is the little-death that brings total obliteration.
I will face my fear.
I will permit it to pass over me and through me.
And when it has gone past, I will turn the inner eye to see its path.
Where the fear has gone there will be nothing. Only I will remain.`

@react.component
let make = () => {
  let (voices, setVoices) = React.useState(() => [])
  let (voice, setVoice) = React.useState(() => None)
  let (text, setText) = React.useState(() => litany)

  React.useEffect0(() => {
    Speech.onVoicesReady(voices => {
      setVoices(_ => voices)
      setVoice(_ => voices->Array.get(0))
    })
    None
  })

  <div>
    {switch voice {
    | None => "No voices"->RR.s
    | Some(voice) => <>
        <Select
          value=voice
          isEqual={(a, b) => a.name == b.name}
          onChange={v => {
            Js.log(v)
            setVoice(_ => Some(v))
          }}>
          {voices
          ->Array.map(voice =>
            <Select.Item key=voice.name label={`${voice.name} (${voice.lang})`} value=voice />
          )
          ->RR.array}
        </Select>
        <Button
          onClick={_ => {
            Speech.cancel()
            let utterance = Speech.makeUtterance(text)
            utterance->Speech.setVoice(voice)
            utterance->Speech.speak
          }}>
          {"Speak"->RR.s}
        </Button>
      </>
    }}
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
