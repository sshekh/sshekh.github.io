---
layout: post
author: Saurav Shekhar
---
Computing `kl_divergence` in tensorflow currently requires [registering a function](https://www.tensorflow.org/api_docs/python/tf/distributions/kl_divergence)
for each of the distribution types (with mostly analytic results). I wrote a monte
carlo estimate computer which works on any two distributions and is decently accurate
(accuracy can be increased by increasing `n_samples`).
```python
@kullback_leibler.RegisterKL(RandomVariable, RandomVariable)
def _kl_monte_carlo(q, p, n_samples=1000, name=None):
    """Compute Monte Carlo Estimate of KL divergence."""
    if not is_distribution(q) or not is_distribution(p):
        raise NotImplementedError(
            "type %s and type %s not supported. If they have a sample() and"
            "log_prob() method add them" % (type(distribution_a).__name__,
                                            type(distribution_b).__name__))
    samples = q.sample([n_samples])
    expectation_q = tf.reduce_mean(q.log_prob(samples))
    expectation_p = tf.reduce_mean(p.log_prob(samples))
    return expectation_q - expectation_p
```
