rule sketch_genome1:
	input:
		"genomes/GCF_000017325.1.fna.gz",
	output:
		"GCF_000017325.1.fna.gz.sig",
	shell:
		"""
		sourmash sketch dna -p k=31 {input} --name-from-first
		"""

rule sketch_genome2: 
	input:
		"genomes/GCF_000020225.1.fna.gz",
	output:
		"GCF_000020225.1.fna.gz.sig",
	shell: 
		""" 
		sourmash sketch dna -p k=31 {input} --name-from-first
		"""

rule sketch_genome3:
	input:
		"genomes/GCF_000021665.1.fna.gz",
	output:
		"GCF_000021665.1.fna.gz.sig",
	shell: 
		"""
		sourmash sketch dna -p k=31 {input} --name-from-first
		"""

		
rule compare_genomes:
	input: 
		"GCF_000017325.1.fna.gz.sig",
		"GCF_000020225.1.fna.gz.sig",
		"GCF_000021665.1.fna.gz.sig"
	output:
		"compare.mat"
	shell: 
		"""

		sourmash compare {input} -o {output}
		"""

rule plot_comparison:
	message: "compare all input genomes using sourmash"
	input:
		"compare.mat"
	output:
		"compare.mat.matrix.png"
	shell: 
		"""
		sourmash plot {input}
    		"""

