data {
    int<lower=0> N;
    vector[N] heights;
}

parameters {
    real<lower=0> mu;
    real<lower=0> sigma;
}


model {
    mu ~ normal(154, 7.7);
    sigma ~ normal(15, 3);
    heights ~ normal(mu, sigma);
}

generated quantities {
    real height_fit = normal_rng(mu, sigma);
}