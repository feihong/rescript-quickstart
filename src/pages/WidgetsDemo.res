@deriving(jsConverter)
type fruit =
  | Avocado
  | Banana
  | Coconut
  | Orange
  | Watermelon

@react.component
let make = () => {
  <div>
    <div>
      <div> {"Select"->RR.s} </div>
      {
        let (value, setValue) = React.useState(() => Avocado)
        <>
          <Select value isEqual={(a, b) => a == b} onChange={v => setValue(_ => v)}>
            <Select.Item label="Avocado" value=Avocado />
            <Select.Item label="Banana" value=Banana />
            <Select.Item label="Coconut" value=Coconut />
            <Select.Item label="Orange" value=Orange />
            <Select.Item label="Watermelon" value=Watermelon />
          </Select>
          <div> {`Current value: ${value->fruitToJs->string_of_int}`->RR.s} </div>
        </>
      }
    </div>
  </div>
}
