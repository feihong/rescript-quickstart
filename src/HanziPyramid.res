let getRandomHanzi = count =>
  Array.makeBy(count, _i =>
    Js.Math.random_int(0x4e00, 0x9fff + 1)->Js.String2.fromCharCode
  )->Array.joinWith("")

@react.component
let make = () => {
  let initCount = 8
  let (count, setCount) = RR.useState(_ => initCount->string_of_int)
  let (value, setValue) = RR.useState(_ => getRandomHanzi(initCount))

  <div>
    <h1 className="text-4xl"> {"Hanzi pyramid"->RR.s} </h1>
    <div>
      <input
        placeholder="Number of characters"
        type_="number"
        className="border-black"
        value={count}
        onChange={evt => setCount(_ => ReactEvent.Form.target(evt)["value"])}
      />
      <button
        className="bg-blue-500 hover:bg-blue-700 text-white rounded p-1"
        onClick={_ =>
          setValue(_ => count->int_of_string_opt->Belt.Option.getWithDefault(1)->getRandomHanzi)}>
        {"Generate"->RR.s}
      </button>
    </div>
    <p className="text-3xl"> {value->RR.s} </p>
  </div>
}
