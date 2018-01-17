test_df <- data.frame(
    dset = rep(c("A", "B", "C", "D"), each = 4),
    x_value = sample(1:50, 16, replace = TRUE),
    y_value = sample(30:80, 16, replace = TRUE)
)

print(test_df)

test_df$coord <- paste(test_df$x_value, test_df$y_value)

print(test_df)