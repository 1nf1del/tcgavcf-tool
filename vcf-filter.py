#!/usr/bin/env python

import sys

if __name__ == "__main__":
    allowed_seq = {}

    input_vcf = sys.argv[1]
    filter_file = sys.argv[2]
    output_vcf = sys.argv[3]

    with open(filter_file) as handle:
        for line in handle:
            for elem in line.rstrip().split(","):
                allowed_seq[elem] = True

    with open(input_vcf) as ihandle:
        with open(output_vcf, "w") as ohandle:
            for line in ihandle:
                write = False
                if line.startswith("#"):
                    write = True
                else:
                    tmp = line.split("\t")
                    if tmp[0] in allowed_seq:
                        write = True
                if write:
                    ohandle.write(line)
