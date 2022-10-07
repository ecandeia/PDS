#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Mar 13 08:39:38 2020

@author: ecg
"""

import numpy as np
import matplotlib.pyplot as plt

Npoints = 10

t = np.arange(0,20,1/Npoints)

Ts = 1/Npoints
print(t)

print(t-Ts)

signal = np.cos(0)*np.sinc(t/Ts) + np.cos(Ts)*np.sinc((t - Ts)/Ts)  + np.cos(2*Ts)*np.sinc((t - 2*Ts)/Ts)

plt.plot(t, signal)
plt.show()
