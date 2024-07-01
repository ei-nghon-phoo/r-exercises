# Install required packages if not already installed
if (!require(jsonlite)) install.packages("jsonlite", dependencies = TRUE)
if (!require(openxlsx)) install.packages("openxlsx", dependencies = TRUE)

# Load required packages
library(jsonlite)
library(openxlsx)

# JSON data in text format
json_text <- '{
    "COMMAND_TYPE_UNKNOWN": {
        "errorCode": "GENERIC_SERVER_ERROR",
        "errorDescription": "GENERIC_SERVER_ERROR"
    },
    "HUB_PARTICIPANT_ID_MISMATCH": {
        "errorCode": "GENERIC_SERVER_ERROR",
        "errorDescription": "GENERIC_SERVER_ERROR"
    },
    "UNABLE_TO_CANCEL_TRANSFER_RESERVATION_AND_COMMIT": {
        "errorCode": "GENERIC_SERVER_ERROR",
        "errorDescription": "GENERIC_SERVER_ERROR"
    },
    "UNABLE_TO_ADD_TRANSFER": {
        "errorCode": "INTERNAL_SERVER_ERROR",
        "errorDescription": "INTERNAL_SERVER_ERROR"
    },
    "UNABLE_TO_UPDATE_TRANSFER": {
        "errorCode": "INTERNAL_SERVER_ERROR",
        "errorDescription": "INTERNAL_SERVER_ERROR"
    },
    "UNABLE_TO_DELETE_TRANSFER_REMINDER": {
        "errorCode": "INTERNAL_SERVER_ERROR",
        "errorDescription": "INTERNAL_SERVER_ERROR"
    },
    "HUB_NOT_FOUND": {
        "errorCode": "GENERIC_ID_NOT_FOUND",
        "errorDescription": "GENERIC_ID_NOT_FOUND"
    },
    "HUB_ACCOUNT_NOT_FOUND": {
        "errorCode": "GENERIC_ID_NOT_FOUND",
        "errorDescription": "GENERIC_ID_NOT_FOUND"
    },
    "PAYER_POSITION_ACCOUNT_NOT_FOUND": {
        "errorCode": "PAYER_FSP_ID_NOT_FOUND",
        "errorDescription": "PAYER_FSP_ID_NOT_FOUND"
    },
    "PAYER_LIQUIDITY_ACCOUNT_NOT_FOUND": {
        "errorCode": "PAYER_FSP_ID_NOT_FOUND",
        "errorDescription": "PAYER_FSP_ID_NOT_FOUND"
    },
    "PAYER_PARTICIPANT_NOT_FOUND": {
        "errorCode": "PAYER_FSP_ID_NOT_FOUND",
        "errorDescription": "PAYER_FSP_ID_NOT_FOUND"
    },
    "PAYEE_POSITION_ACCOUNT_NOT_FOUND": {
        "errorCode": "PAYEE_FSP_ID_NOT_FOUND",
        "errorDescription": "PAYEE_FSP_ID_NOT_FOUND"
    },
    "PAYEE_LIQUIDITY_ACCOUNT_NOT_FOUND": {
        "errorCode": "PAYEE_FSP_ID_NOT_FOUND",
        "errorDescription": "PAYEE_FSP_ID_NOT_FOUND"
    },
    "PAYEE_PARTICIPANT_NOT_FOUND": {
        "errorCode": "PAYEE_FSP_ID_NOT_FOUND",
        "errorDescription": "PAYEE_FSP_ID_NOT_FOUND"
    },
    "TRANSFER_NOT_FOUND": {
        "errorCode": "TRANSFER_ID_NOT_FOUND",
        "errorDescription": "TRANSFER_ID_NOT_FOUND"
    },
    "UNABLE_TO_GET_TRANSFER": {
        "errorCode": "TRANSFER_ID_NOT_FOUND",
        "errorDescription": "TRANSFER_ID_NOT_FOUND"
    },
    "TRANSFER_EXPIRED": {
        "errorCode": "TRANSFER_EXPIRED",
        "errorDescription": "TRANSFER_EXPIRED"
    },
    "UNABLE_TO_CANCEL_TRANSFER_RESERVATION": {
        "errorCode": "GENERIC_SERVER_ERROR",
        "errorDescription": "GENERIC_SERVER_ERROR"
    },
    "TRANSFER_LIQUIDITY_CHECK_FAILED": {
        "errorCode": "PAYER_FSP_INSUFFICIENT_LIQUIDITY",
        "errorDescription": "PAYER_FSP_INSUFFICIENT_LIQUIDITY"
    },
    "PAYER_PARTICIPANT_ID_MISMATCH": {
        "errorCode": "GENERIC_PAYER_BLOCKED_ERROR",
        "errorDescription": "GENERIC_PAYER_BLOCKED_ERROR"
    },
    "PAYER_PARTICIPANT_NOT_ACTIVE": {
        "errorCode": "GENERIC_PAYER_BLOCKED_ERROR",
        "errorDescription": "GENERIC_PAYER_BLOCKED_ERROR"
    },
    "PAYER_PARTICIPANT_NOT_APPROVED": {
        "errorCode": "GENERIC_PAYER_BLOCKED_ERROR",
        "errorDescription": "GENERIC_PAYER_BLOCKED_ERROR"
    },
    "PAYEE_PARTICIPANT_ID_MISMATCH": {
        "errorCode": "DESTINATION_FSP_ERROR",
        "errorDescription": "DESTINATION_FSP_ERROR"
    },
    "PAYEE_PARTICIPANT_NOT_ACTIVE": {
        "errorCode": "DESTINATION_FSP_ERROR",
        "errorDescription": "DESTINATION_FSP_ERROR"
    },
    "PAYEE_PARTICIPANT_NOT_APPROVED": {
        "errorCode": "DESTINATION_FSP_ERROR",
        "errorDescription": "DESTINATION_FSP_ERROR"
    }
}'

# Parse JSON text
data_list <- fromJSON(json_text, flatten = TRUE)

# Convert JSON data to a formatted data frame
formatted_data <- data.frame(
  "error object name" = names(data_list),
  "errorCode" = sapply(data_list, function(x) x$errorCode),
  "errorDescription" = sapply(data_list, function(x) x$errorDescription)
)
# Write data frame to a CSV file
write.csv(formatted_data, "error_code.csv", row.names = FALSE)



print("Data has been successfully exported to output.csv")

