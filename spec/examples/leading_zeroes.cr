LEADING_ZEROES_EXAMPLES = {
  default: [
    {
      hex:           "00000000000000000000123456789ABCDEF0",
      b58:           "111111111143B9igPG3dy",
      b58_no_zeroes: "43B9igPG3dy",
    },
    {
      hex:           "00000000000000000000",
      b58:           "1111111111",
      b58_no_zeroes: "1",
    },
    {
      hex:           "00",
      b58:           "1",
      b58_no_zeroes: "1",
    },
    {
      hex:           "",
      b58:           "1",
      b58_no_zeroes: "1",
    },
  ],
  bitcoin: [
    {
      hex:           "00000000000000000000123456789ABCDEF0",
      b58:           "111111111143c9JGph3DZ",
      b58_no_zeroes: "43c9JGph3DZ",
    },
    {
      hex:           "00000000000000000000",
      b58:           "1111111111",
      b58_no_zeroes: "1",
    },
    {
      hex:           "00",
      b58:           "1",
      b58_no_zeroes: "1",
    },
    {
      hex:           "",
      b58:           "1",
      b58_no_zeroes: "1",
    },
  ],
  ripple: [
    {
      hex:           "00000000000000000000123456789ABCDEF0",
      b58:           "rrrrrrrrrrhsc9JGF6sDZ",
      b58_no_zeroes: "hsc9JGF6sDZ",
    },
    {
      hex:           "00000000000000000000",
      b58:           "rrrrrrrrrr",
      b58_no_zeroes: "r",
    },
    {
      hex:           "00",
      b58:           "r",
      b58_no_zeroes: "r",
    },
    {
      hex:           "",
      b58:           "r",
      b58_no_zeroes: "r",
    },
  ],
}
