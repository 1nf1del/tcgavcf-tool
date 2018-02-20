cwlVersion: v1.0
class: CommandLineTool
label: tcga-vcf-reheader
baseCommand: ["bash", "/opt/reheader_wrapper.sh"]
requirements:
  - class: DockerRequirement
    dockerImageId: kamichiotti/tcgavcf
  - class: InitialWorkDirRequirement
    listing: [ $(inputs.input_vcf) ]

inputs:
  input_vcf:
    type: File
    inputBinding:
      prefix: -i
  tumor_analysis_uuid:
    type: string
    inputBinding:
      prefix: -T
  tumor_bam_name:
    type: string
    inputBinding:
      prefix: -B
  tumor_aliquot_uuid:
    type: string
    inputBinding:
      prefix: -X
  tumor_aliquot_name:
    type: string
    inputBinding:
      prefix: -A
  normal_analysis_uuid:
    type: string
    inputBinding:
      prefix: -n
  normal_bam_name:
    type: string
    inputBinding:
      prefix: -b
  normal_aliquot_uuid:
    type: string
    inputBinding:
      prefix: -x
  normal_aliquot_name:
    type: string
    inputBinding:
      prefix: -a
  platform:
    type: string
    inputBinding:
      prefix: -p
  center:
    type: string
    inputBinding:
      prefix: -c

outputs:
  rehead_vcf:
    type: File
    outputBinding:
      glob: "*.reheadered.vcf"
