class Translation
  CODON_LOOKUP =
  {
    'Methionine' => ['AUG'], 'Phenylalanine' => ['UUU', 'UUC'],
    'Leucine' => ['UUA', 'UUG'], 'Serine' => ['UCU', 'UCC', 'UCA', 'UCG'],
    'Tyrosine' => ['UAU', 'UAC'], 'Cysteine' => ['UGU', 'UGC'],
    'Tryptophan' => ['UGG'], 'STOP' => ['UAA', 'UAG', 'UGA']
  }

  def self.of_codon(codon)
    CODON_LOOKUP.each_pair do |protein, codons|
      return protein if codons.include?(codon)
    end
    raise 'InvalidCodonError'
  end

  def self.of_rna(strand)
    strand_split = []
    until strand == ''
      strand_split << strand.slice!(0,3)
    end
    # could use an enumerator to skip
    result = []
    strand_split.each do |codon|
      break if Translation.of_codon(codon) == 'STOP'
      result << Translation.of_codon(codon)
    end
    result
  end
end


# strand = 'AUGUUUUAA'
# p Translation.of_rna(strand)
# p Translation.of_rna('CARROT')
