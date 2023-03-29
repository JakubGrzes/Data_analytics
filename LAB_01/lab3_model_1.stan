data {
    int<lower=1> N;
}

generated quantities {
    int<lower=0, upper=N> y;
    real<lower=0, upper=1> p;
    p = normal_rng(0.2, 0.02);
    y = binomial_rng(N, p);
}