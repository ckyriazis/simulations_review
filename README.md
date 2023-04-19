# Scripts for Kyriazis et al. 2023 AmNat: 

The aim of this paper is to provide an overview of computational simulation models in ecological and conservation genomics and review recent debates about simulation parameters. Here, we provide all SLiM scripts used in our analysis (found in the **`simulation_scripts`** directory), output data from SLiM simulations (found in the **`data`** directory), and R code for visualizing results (found in the **`plotting_scripts`** directory). All code was written by Chris Kyriazis (ckyriazis@g.ucla.edu). 

Note that the software versions used here are SLiM v4.0.1 and R v3.5.0. 

## Scripts for visualizing existing DFE and dominance models

In Figures 1 and 2 in our paper, we visualize existing DFE and dominance models. Scripts for making these plots are **`plot_all_DFEs.R`** (for Figure 1) and **`DFE_comparison.R`** (for Figure 2). 

## Validating models using SLiM simulations

In our paper, we set out to validate and compare several recent deleterious mutation models, including models from [Kyriazis et al. 2021](https://doi.org/10.1002/evl3.209), [Kardos et al. 2021](https://doi.org/10.1073/pnas.2104642118), and [Perez-Pereira et al. 2022](https://doi.org/10.1007/s10592-021-01405-7). In addition, we also propose a new model and include this model in our comparisons. 

The first approach we use for model validation is to simulate under each model and compare the predicted site frequency spectrum (SFS) to an empirical SFS from the 1000 Genomes project dataset in humans. For these simulations, we used SLiM and simulated genetic variation for two human autosomes, outputing the neutral and synonymous SFS. 

Scripts for these simulations are included in the **`simulation_scripts/SFS_scripts`** directory. The output data from our simulations is included in the **`data/SFS_data`** directory, and the script for plotting these results is **`plotting_scripts/plot_sfs.R`**.

The next approach we employed for model validation is to compare the predicted inbreeding load from each model to empirical estimates for humans. For this analysis, we again ran SLiM simulations under each model using scripts in the in the **`simulation_scripts/inbreedingLoad_scripts`** directory. The output data from our simulations is included in the **`data/inbreedingLoad_data`** directory, and the script for plotting these results is **`plotting_scripts/plot_2B.R`**.

## SLiM scripts for the Kyriazis et al. 2023 model

Given that we propose a new model in this paper, we provide an example script for implementing this model, which may be useful for researchers aiming to simulate deleterious variation for a species of interest. The SLiM script for implementing this model is including here as **`Kyriazis2023_model.slim`**.

Note that we use this model for our simulation example discussed in Supplemental Appendix 1 where we aim to demonstrate the difference between the DFE for segregating and fixed mutations and how this translates to estimates of load. Scripts for these simulations are included in the **`simulation_scripts/segregating_fixed_load_scripts`** directory, output data is included in the **`data/seg_fixed_load_data`** directory, and the script for making Figures S1 and S2 is **`plotting_scripts/plot_seg_fixed_DFE.R`**.

Finally, we also use this model for the analysis of nonequilibrium population dynamics presented in Supplemental Appendix 6 and Figure S6. Scripts for these simulations are included in **`simulation_scripts/population_contraction_scripts`**, output data are included in **`data/pop_contr_100`** and  **`data/pop_contr_1000`**, and the script for plotting is **`plotting_scripts/plot_pop_contraction.R`**. 

## Analysis of equilibrium effective population size

One final analysis we conduct is to estimate the equilibrium effective population size (Ne) based on genome-wide heterozygosity estimates from 42 species of mammals. This data is included as **`data/het_table_mammals.csv`** and the script for plotting is **`plotting_scripts/plot_eq_Ne.R`**


