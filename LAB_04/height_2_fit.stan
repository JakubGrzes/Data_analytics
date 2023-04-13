data {
  int<lower=0> N; 
  real weight[N]; 
}

parameters { 
    real mu; 
    real<lower=0> sigma; 
    real alpha;
    real beta;
}

transformed parameters {
    real mu_array[N];
    for (i in 1:N) {
        mu_array[i] = alpha + beta * weight[i];
    }
}

model {
    mu ~ normal(170, 15); 
    sigma ~ normal(15, 5); 
    alpha ~ normal(170, 15);
    beta ~ normal(0,1);
  
}

generated quantities {
    real height_sample; 
    for (i in 1:N) {
        height_sample = normal_rng(mu_array[i], sigma); 
    }
}