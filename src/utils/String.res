include Js.String2

let equal = (s1: string, s2: string): bool => s1 == s2

let compare = (s1: string, s2: string): int => Pervasives.compare(s1, s2)
