let getRandomHanzi = count =>
  Array.makeBy(count, _i =>
    Js.Math.random_int(0x4e00, 0x9fff + 1)->Js.String2.fromCharCode
  )->Array.joinWith("")

let getHanziLines = count => Array.makeBy(count, i => getRandomHanzi(i))

@react.component
let make = () => {
  let initCount = 8
  let (count, setCount) = RR.useState(() => initCount->string_of_int)
  let (lines, setLines) = RR.useState(() => getHanziLines(initCount))

  let generate = () =>
    setLines(_ => count->int_of_string_opt->Belt.Option.getWithDefault(1)->getHanziLines)

  <div>
    <h1 className="text-4xl"> {"Hanzi pyramid"->RR.s} </h1>
    <div>
      <input
        placeholder="Number of characters"
        type_="number"
        className="border-black"
        value={count}
        onChange={evt => setCount(_ => ReactEvent.Form.target(evt)["value"])}
        onKeyPress={evt =>
          if ReactEvent.Keyboard.key(evt) == "Enter" {
            generate()
          }}
      />
      <button
        className="bg-blue-500 hover:bg-blue-700 text-white rounded p-1" onClick={_ => generate()}>
        {"Generate"->RR.s}
      </button>
    </div>
    {lines
    ->Array.mapWithIndex((i, line) =>
      <p key={i->string_of_int} className="text-3xl"> {line->RR.s} </p>
    )
    ->RR.array}
  </div>
}
