cwlVersion: v1.0
class: CommandLineTool
label: tcga-vcf-reheader
baseCommand: ["python", "/opt/tcga-vcf-reheader.py"]
requirements:
  - class: DockerRequirement
    dockerImageId: kamichiotti/tcgavcf

inputs:
  input_vcf:
    type: File
    inputBinding:
      position: 1
  output_vcf:
    type: File
    inputBinding:
      position: 2
  config:
    type: File
    inputBinding:
      position: 3

outputs:
  output_vcf
    type: File
    outputBinding:
      glob: $(inputs.output_vcf)
