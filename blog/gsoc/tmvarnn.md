### [](#header-3) Recurrent Networks in TMVA

The initial plan was to have two layers of abstraction (inspired from Tensorflow). One layer for the Recurrent Cell, and one for the time unrolling using this cell. See
[this presentation](https://docs.google.com/presentation/d/1Kn5Xn1VY8TzTcqyrtBTYAHEk5AAEdJLAd15-jmaDHPE/edit#slide=id.p) for more details. However after writing the 
deep learning module, we concluded that writing the entire `RNNLayer` as a single class would be better suited. The cell technique was still kept in `Forward()` and
`Backward()` functions to maintain better modularity.

At [https://github.com/tmvadnn/tmva-dnn-tutorial](https://github.com/tmvadnn/tmva-dnn-tutorial) and [https://github.com/tmvadnn/root/blob/master/tmva/tmva/test/DNN/RNN/TestFullRNN.cxx](https://github.com/tmvadnn/root/blob/master/tmva/tmva/test/DNN/RNN/TestFullRNN.cxx) you can find some examples using the Recurrent Networks. 
The repository isstill under construction, and we will be adding better examples.

Here is an example of an `RNN->Reshape->DenseLayer` network learning the identity function (input of dimensionality two stored as a state of size 3 in RNN, then
reconstructed by DenseLayer). 

Reference-style: 
![Training of RNN on identity function][loss]

[loss]: https://github.com/sshekh/sshekh.github.io/tree/master/blog/gsoc/loss.png  "Training loss for Recurrent Network on Identity function"
