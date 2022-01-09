# walk.py simulates a simple symmetric random walk over N steps
# Feel free to change the value of N!
# Close the plot window to return control to the program.

import random
import matplotlib.pyplot as plt

def walk(N):

    t = [0]   # list to store times
    S = [0]   # list to store locations of the random walk

    for j in range(0,N):
        t.append(j+1)
        S.append(S[j] + random.choice([-1, 1]))

    if N <= 50:
        # plot with lines and dots
        plt.plot(t, S, 'b-')
        plt.plot(t, S, 'b.')

    else:
        # just plot lines
        plt.plot(t, S, 'b-')

    plt.show()
    
    return

# actually run the walk method
walk(50)
walk(500)
walk(5000)