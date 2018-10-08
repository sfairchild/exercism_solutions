const dnaToRna = {
  C: 'G',
  G: 'C',
  T: 'A',
  A: 'U',
};

const isInvalid = dnaStrand => (
  [...dnaStrand].some(nucleotide => !Object.keys(dnaToRna).includes(nucleotide))
);

export default class {
  toRna(dnaStrand) {
    if (isInvalid(dnaStrand)) {
      throw Error('Invalid input DNA.');
    }

    return [...dnaStrand].reduce((newStrand, nucleotide) => (
      newStrand + dnaToRna[nucleotide]
    ), '');
  }
}
