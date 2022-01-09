# Runs a random walk.

import random

def trythis():
    print 'Tried again twice.'
    return

def walk(N):

    import random
    import matplotlib.pyplot as plt

    # Initialize these variables as arrays
    t = {}
    S = {}

    t[0] = 0
    S[0] = 0
    
    for j in range(N):
        t[j+1] = j + 1
        S[j+1] = S[j] + random.choice([-1, 1])

    plt.plot(t, S)
    plt.show()

    if N < 50:
        print "N Less than 50."

    else:
        print "N Not less than 50."
    
    return
