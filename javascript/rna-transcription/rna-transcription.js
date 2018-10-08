const dnaToRna = {
  C: 'G',
  G: 'C',
  T: 'A',
  A: 'U',
};

export default class {
  toRna(dnaStrand) {
    return [...dnaStrand].map((nucleotide) => {
      if (!Object.keys(dnaToRna).includes(nucleotide)) {
        throw Error('Invalid input DNA.');
      }
      return dnaToRna[nucleotide];
    }).join('');
  }
}
