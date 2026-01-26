= Evaluating Neural Efficiency of Sensing Modalities

== Background

Many existing works have explored using multi-modal inputs to perform tasks . The
choice of modalities are often based on non-machine-based methods (for
instance, using humans) and intuition of the designers. We wish to explore the
best allocation of neurons for learning the representation of each modality for
the classic hunting task. Through this method, we hope to determine the coding
efficiency of each modality. 

The inspiration for this work derives from evolutionary biology. For instance,
dogs have roughly 220 million olfactory neurons while humans only tend to have
5-6 million @quignonComparisonCanineHuman2003 @kokocinska-kusiakCanineOlfactionPhysiology2021. 
On the other hand, the human visual cortex is much larger than those
of dogs. We attempt to study (in an abstract version of this problem) why this
may be the case, given a particular set of senses and a fixed task. If both
humans and dogs had the same set of senses, would the size of the olfactory,
visual and auditory cortices be the same (as percentages of the brain)?

== Research Question

Given a set of sensors, what is the best neuronal allocation for sensing
modality representation for a particular task? How can we unify the
representation of the senses across modalities with comparable parameters and
costs? How do these results change in the presence of noise?

== Proposed Approach

For simplicity, we will be solving a 2D version of this problem. To simulate
vision, we will use perspective projection (rasterization) with three channels
(where the target is in a fixed color). To simulate audio, we may be forced to
use raytracing to simulate sound in the presence of occlusion @REALTIMESIMULATIONSOUND2006. Further research
into this area is required. For olfaction, in line with previous works, we use a
diffusion equation to model the rate of propagation of an odor plume
@rigolliLearningPredictTarget2022. 
In the human brain, primary sensory cortices handle modality-specific
representations (such as V1 for visual information and A1 for auditory
information). Secondary cortices (for example, V2/V3/V4), on the other hand, 
recieve cross-modal inputs from A1 and V1. In humans, V1 and A1 are much larger
than the secondary cortices. We find an equivalent in artificial neural networks
through embedding dimension and a downstream MLP. 

The input dimension of all three input modalities is fixed. Since vision has a
higher dimensional input than olfaction and audio, we will use update rate,
quantization and buffer size to normalize "information rate." The embedding
dimension is also fixed; however, the partition between modalities is explicit
and dimension of each modality may vary. We can partition our network via
a learnable "weight mask" at each layer which determines the boundary between 
modalities -- this can be used in either an MLP as dropout or as a block 
diagonal attention mask if using a transformer. 

The embedding is updated by the inputs at rate $r_e$. We then have a
reinforcement learning agent which updates its internal state and can move
(action) at a rate $r_a$. We will evaluate each neuron allocation (i.e. mask)
based on the ability of the network to "hunt" a target. If time permits, we will
explore the robustness of each allocation (adding noise all three modalities). 

We acknowledge that there are similarities between our proposal and "Learning
Pursuit Strategies from the Scents of the Prey" led by Fatih Dinc. The primary
difference is we wish to focus less on the emergent properties of the model
architecture (RNNs) and instead focus on efficiency of the modalities
themselves. We also focus more on multi-modality than scent alone. 

#bibliography("artemis.bib")
