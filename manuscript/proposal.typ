#import "@preview/fine-lncs:0.4.0": lncs, institute, author, theorem, proof

#let inst_ucsb = institute("University of California, Santa Barbara", 
  addr: "Santa Barbara, CA, USA"
)

#show: lncs.with(
  title: "Evaluating Neural Efficiency of Sensing Modalities",
  authors: (
    author("Anantajit Subrahmanya", 
      insts: (inst_ucsb),
    ),
    author("Aaditya Prakash Kattekola", 
      insts: (inst_ucsb),
    ),
  ),
  abstract: [
    
  ],
  bibliography: bibliography("artemis.bib")
)

= Overview

In this project, we explore the "neural" efficiency of two sensing modalities (vision and olfaction) for a hunting task. In both cases, an agent which uses Reinforcement Learning (RL) to navigate a maze to locate a particular target. We then evaluate the efficiency of each modality by constraining the neural capacity of the agents. By comparing task performance across modalities with different neural capacity constraints, we can understand under which conditions vision outperforms olfaction (and vice versa).

We are still in the process of formally defining neural capacity. One paper caps neural capacity by limiting the precision for the expected reward of each state-action pair (q-value) @patel_dynamic_2020. Under this model, the reinforcement learning cost function penalizes changes in the distribution of the q-values from a uniform baseline, which the authors compare to changes in neuron recruitment in biological neural networks. The resulting trained network hence has more important state-action pairs in the Q table with lower variance (higher precision) and the less important state-action pairs as high variance (lower precision). If we were to use this model for our project, the Fisher information of the Q matrix distribution (array of Gaussians) could be used as a quantitative measure of neural capacity. We may also consider Differentiable Architecture Search @liu_darts_2019, which approximates the network architecture in a differentiable space so traditional optimization methods may be used.

For simulation, we will develop a simple 2D simulation environment. For vision, we can use linear projection onto a vector mapping to a finite FOV. For olfaction, we will start with a simple diffusion equation as used in previous works @rigolliLearningPredictTarget2022. If time permits, we will introduce noise, turbulence and other perturbations. Further research is required to make the artifacts "comparable" and "fair" across both modalities (fixing SNR, for instance). 

