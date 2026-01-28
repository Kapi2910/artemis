from __future__ import annotations
from abc import ABC, abstractmethod
import numpy as np


class ISense(ABC):
    """
    An abstraction on what a sense is. It is just a vector, for now
    """
    @abstractmethod
    def __init__(self, n_dim: int):
        self.state: np.ndarray = np.zeros((1,n_dim))


class IAgent(ABC):
    """
    An abstraction on what a agent is. A mobile entity in space with that posses a list of senses.
    The agent uses it's sense to update it's motion.
    """
    @abstractmethod
    def __init__(self, n_dim: int):
        self.pos: np.ndarray = np.zeros((1,2))
        self.vel: np.ndarray = np.zeros((1,2))
        self.senses: list = []

    @abstractmethod
    def sense(self):
        pass

    @abstractmethod
    def step(self):
        pass

