#!/usr/bin/env python3

import sys

def init(prevmerit: float, credit: float, args: list):
    dsum = 0
    tsum = 0
    for arg in args:
        try:
            p1, p2 = arg.split(":")
            p1, p2 = float(p1), float(p2)

            tsum += p2
            dsum += p1 * p2
        except (UnboundLocalError, ValueError):
            pass

    print(f"THIS TERM\nMerit: {dsum/tsum}\nTotal points: {tsum}\nScaled sum: {dsum}")
    print("")
    avrmerit = ((dsum/tsum) + prevmerit)/2
    print(f"Final merit: {avrmerit}")
    print(f"Actual final merit: {avrmerit + credit}")

if __name__ == "__main__":
    prevmerit = sys.argv[1]
    prevmerit = float(prevmerit)

    credit = sys.argv[2]
    credit = float(credit)

    grades = sys.argv[2:]

    init(prevmerit, credit, grades)
