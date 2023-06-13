## PRODUCE DATA FRAMES WITH WIDELY VARIED TP/FN/TN/FP FOR TEST 1 & TEST 2
## COVER RANGE OF PREVALENCES
## COVER RANGE OF N VALUES

a <- c(50, 90, 200, 500, 1000) # n values
b <- c(0.5, 0.75, 0.9, 0.99) # Test1 variations
d <- c(0.5, 0.75, 0.9, 0.99) # Test2 variations
f <- c(0.95, 0.9, 0.75, 0.5, 0.25, 0.1, 0.05) # Prevalence variations

df_list <- list()

set.seed(7891)

for (aa in a) {
  for (bb in b) {
    for (dd in d) {
      for (ff in f) {
        test1 <- sample(c(0, 1), aa, prob = c(bb, 1 - bb), replace = TRUE)
        test2 <- sample(c(0, 1), aa, prob = c(dd, 1 - dd), replace = TRUE)
        gold <- sample(c(0, 1), aa, prob = c(ff, 1 - ff), replace = TRUE)

        df <- recoder(data.frame(test1, test2, gold))
        df_list[[paste0("a", aa, "_b", bb, "_d", dd, "_f", ff)]] <- df
      }
    }
  }
}

## LOOK FOR ERRORS IN COMP2BDT PERFORMANCE

# Initialize a list to store the results and error indices
result_list <- vector("list", length(df_list))
error_indices <- vector("integer")
mismatch <- 0

# Iterate over each element of the list
for (i in seq_along(df_list)) {
  # Apply the function with error handling
  result <- tryCatch({
    comp2bdt(df_list[[i]])
  }, error = function(err) {
    # If an error occurs, record the index and return a default value
    error_indices <- c(error_indices, i)
  })

  # Store the result
  result_list[[i]] <- result

}

for (j in seq_along(result_list)) {
  ## access list elements
  element <- result_list[[j]]
  ## select levels of interest
  acc <- element$acc
  pv <- element$pv
  lr <- element$lr
  ## select values of interest
  acc.glob <- acc$glob.p.adj
  sens <- acc$sens.p.adj
  spec <- acc$spec.p.adj

  if(is.na(acc.glob) | is.na(sens) | is.na(spec)) {
    next
  }

  if(acc.glob < 0.05 && sens >= 0.05 && spec >= 0.05) (
    mismatch <- mismatch + 1
  )

}

print(mismatch)

expect_length(error_indices, 0)
expect_lt(mismatch, 0.01*length(result_list))

# Test 2: More comprehensive range of tests:

## PRODUCE DATA FRAMES WITH WIDELY VARIED TP/FN/TN/FP FOR TEST 1 & TEST 2
## COVER RANGE OF PREVALENCES
## COVER RANGE OF N VALUES

set.seed(123) # Set a seed for reproducibility

# Generate the data frames for each combination
for (n_val in n) {
  for (prev in prevalence) {
    for (sens1 in sensitivity_test1) {
      for (sens2 in sensitivity_test2) {
        for (spec1 in specificity_test1) {
          for (spec2 in specificity_test2) {
            # Calculate the number of "yes" and "no" values
            num_yes <- round(n_val * prev)
            num_no <- n_val - num_yes

            # Calculate the number of "yes" and "no" values for sensitivity and specificity
            sens_yes <- round(num_yes * sens1)
            sens_no <- num_yes - sens_yes
            spec_yes <- round(num_no * spec1)
            spec_no <- num_no - spec_yes

            # Generate test1, test2, and gold vectors with noise
            test1 <- sample(c(rep("yes", sens_yes), rep("no", sens_no), rep("yes", spec_yes), rep("no", spec_no)), n_val)

            sens_yes <- round(num_yes * sens2)
            sens_no <- num_yes - sens_yes
            spec_yes <- round(num_no * spec2)
            spec_no <- num_no - spec_yes

            test2 <- sample(c(rep("yes", sens_yes), rep("no", sens_no), rep("yes", spec_yes), rep("no", spec_no)), n_val)
            gold <- sample(c(rep("yes", num_yes), rep("no", num_no)), n_val)

            # Create the data frame
            df <- data.frame(test1, test2, gold)
            df_list[[paste0("n", n_val, "_prev", prev, "_sens1", sens1, "_sens2", sens2, "_spec1", spec1, "_spec2", spec2)]] <- df
          }
        }
      }
    }
  }
}

## LOOK FOR ERRORS IN COMP2BDT PERFORMANCE

# Initialize a list to store the results and error indices
result_list <- vector("list", length(df_list))
error_indices <- vector("integer")
mismatch <- 0

# Iterate over each element of the list
for (i in seq_along(df_list)) {
  # Apply the function with error handling
  result <- tryCatch({
    comp2bdt(df_list[[i]])
  }, error = function(err) {
    # If an error occurs, record the index and return a default value
    error_indices <- c(error_indices, i)
    NA
  })

  # Store the result
  result_list[[i]] <- result

}

for (j in seq_along(result_list)) {
  ## access list elements
  element <- result_list[[j]]
  ## select levels of interest
  acc <- element$acc
  pv <- element$pv
  lr <- element$lr
  ## select values of interest
  acc.glob <- acc$glob.p.adj
  sens <- acc$sens.p.adj
  spec <- acc$spec.p.adj

  if(is.na(acc.glob) | is.na(sens) | is.na(spec)) {
    next
  }

  if(acc.glob < 0.05 && sens >= 0.05 && spec >= 0.05) (
    mismatch <- mismatch + 1
  )

}

print(mismatch)

expect_length(error_indices, 0)
expect_lt(mismatch, 0.01*length(result_list))

vec <- vector("logical", length(cases))

for(i in 1:length(cases)) {

  index <- cases[i]
  df <- recoder(df_list[[index]])
  v <- values.2test(df)
  vec[i] <- (v$s10 == v$s01) && (v$r10 == v$r01)

}
