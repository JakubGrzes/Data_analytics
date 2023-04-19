data {
  int<lower=0> n; 
  int<lower=0> y[n]; 
  vector[n] log_miles; 
}

parameters {
  real alpha[n];
  real theta;
}

transformed parameters {
  real lambda[n];
  for (i in 1:n) {
    lambda[i] = exp(alpha[i] + theta * log_miles[i]);
  }
}

model {
  alpha ~ normal(1.2, 0.4);
  theta ~ normal(0.5, 0.1);
  for (i in 1:n){
      y[i] ~ poisson(lambda[i]);
  }
}

generated quantities {
    real y_sample[n];
    for (i in 1:n){
        y_sample[i] = poisson_rng(lambda[i]);
    }
}