# based on Lunn 2013, p.116

salmonella_data <- list(y = structure(.Data = c(15,21,29,16,18,21,
                                                16,26,33,27,41,60,
                                                33,38,41,20,27,42),
                                      .Dim = c(6, 3)),
                        x = c(0, 10, 33, 100, 333, 1000), 
                        n = 6,
                        m = 3)


n_chains<- 3

init_func <-  function() list(y_pred=rpois(6,1), alpha=rnorm(1,0,10), beta = rnorm(1,0,10), 
                                              gamma=rnorm(1,0,10))
inits <- list(init_func(), init_func(), init_func())

bugs_out  <- bugs(salmonella_data,  parameters.to.save = c("alpha", "beta", "gamma" ,"y_pred"),
                  model.file="master_salmonella.txt", n.iter = 100000,
                  inits = inits)


