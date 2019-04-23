#!/usr/bin/env python
"""uuid c-style generator"""

import os


def str_to_struct(guid_str):
    """uuid in c-style struct"""
    snip = guid_str.split('-')
    struct = "{{ 0x{0}, 0x{1}, 0x{2}, {{ 0x{3}, 0x{4}, 0x{5}, 0x{6}, 0x{7}, 0x{8}, 0x{9}, 0x{10} }}}}".format(
        snip[0], snip[1], snip[2], snip[3][0:2], snip[3][2:4], snip[4][0:2],
        snip[4][2:4], snip[4][4:6], snip[4][6:8], snip[4][8:10],
        snip[4][10:12])
    return struct


STREAM = os.popen("uuidgen")
GUID_STR = STREAM.read().upper()
print(str_to_struct(GUID_STR))
