@deriving(jsConverter)
type fruit =
  | Avocado
  | Banana
  | Coconut
  | Orange
  | Watermelon

@react.component
let make = () => {
  <div className="space-y-4">
    <H1> {"Widgets Demo"->RR.s} </H1>
    <div>
      <div className="font-bold"> {"Select"->RR.s} </div>
      {
        let (value, setValue) = React.useState(() => Avocado)
        <div className="flex flex-row items-center">
          <div className="mr-6">
            <span className="font-extralight"> {"Current value: "->RR.s} </span>
            {value->fruitToJs->string_of_int->RR.s}
          </div>
          <Select value isEqual={(a, b) => a == b} onChange={v => setValue(_ => v)}>
            <Select.Item label="Avocado" value=Avocado />
            <Select.Item label="Banana" value=Banana />
            <Select.Item label="Coconut" value=Coconut />
            <Select.Item label="Orange" value=Orange />
            <Select.Item label="Watermelon" value=Watermelon />
          </Select>
        </div>
      }
    </div>
  </div>
}
