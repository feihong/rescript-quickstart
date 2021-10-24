module Speech = SpeechSynthesis

let litany = `I must not fear.
Fear is the mind-killer.
Fear is the little-death that brings total obliteration.
I will face my fear.
I will permit it to pass over me and through me.
And when it has gone past, I will turn the inner eye to see its path.
Where the fear has gone there will be nothing. Only I will remain.`

// https://www.reddit.com/r/dune/comments/a3cr0j/litany_against_fear_traditional_mandarin/
let litanyZh = `我絕不能害怕

恐懼會扼殺思維能力

是潛伏的死神

會徹底毀滅一個人

我要容忍它

讓他掠過我的心頭

穿越我的心身

當這一切過去之後

我將睜開心靈深處的眼神

審視它的軌跡

恐懼如風

風過無痕

唯有我依然屹立`

@react.component
let make = () => {
  let (voices: array<Speech.voice>, setVoices) = RR.useStateValue([])
  let (voice, setVoice) = RR.useStateValue(None)
  let (text, setText) = RR.useStateValue(litany)
  let (changed, setChanged) = RR.useStateValue(false)

  React.useEffect0(() => {
    Speech.onVoicesReady(voices => {
      let voices = voices->Belt.SortArray.stableSortBy((v1, v2) => String.compare(v1.lang, v2.lang))
      setVoices(voices)
      setVoice(voices->Array.get(0))
    })
    None
  })

  <div className="flex flex-col space-y-4 h-full">
    <H1> {"Speech Synthesis"->RR.s} </H1>
    {switch voice {
    | None => "No voices"->RR.s
    | Some(voice) =>
      <div className="flex flex-row space-x-2">
        <Select
          value=voice
          isEqual={(a, b) => a.name == b.name}
          onChange={v => {
            Js.log(v)
            if !changed {
              setText(v.lang->String.startsWith("zh") ? litanyZh : litany)
            }
            setVoice(Some(v))
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
        <Button onClick={_ => Speech.cancel()}> {"Stop"->RR.s} </Button>
      </div>
    }}
    <textarea
      className="flex-1"
      cols=80
      value=text
      onChange={evt => {
        setChanged(true)
        setText(ReactEvent.Form.currentTarget(evt)["value"])
      }}
    />
  </div>
}
