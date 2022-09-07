/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  type        = string
  description = "The project ID to manage the Pub/Sub resources."
}

variable "topic" {
  type        = string
  description = "The Pub/Sub topic name."
}

variable "create_topic" {
  type        = bool
  description = "Specify true if you want to create a topic."
  default     = true
}

variable "create_subscriptions" {
  type        = bool
  description = "Specify true if you want to create subscriptions."
  default     = true
}
variable "topic_labels" {
  type        = map(string)
  description = "A map of labels to assign to the Pub/Sub topic."
  default     = {}
}

variable "push_subscriptions" {
  type = list(object({
    name                       = string
    ack_deadline_seconds       = string
    push_endpoint              = string
    x-goog-version             = string
    oidc_service_account_email = string
    audience                   = string
    expiration_policy          = string
    dead_letter_topic          = string
    max_delivery_attempts      = string
    maximum_backoff            = string
    minimum_backoff            = string
    filter                     = string
    subscription_labels        = map(string)
  }))
  description = "The list of the push subscriptions."
  default = [{
    name                       = null
    ack_deadline_seconds       = null
    push_endpoint              = null
    x-goog-version             = null
    oidc_service_account_email = null
    audience                   = null
    expiration_policy          = null
    dead_letter_topic          = null
    max_delivery_attempts      = null
    maximum_backoff            = null
    minimum_backoff            = null
    filter                     = null
  subscription_labels = null }]
}

variable "pull_subscriptions" {
  type = list(object({
    name                         = string
    ack_deadline_seconds         = string
    dead_letter_topic            = string
    max_delivery_attempts        = string
    maximum_backoff              = string
    minimum_backoff              = string
    filter                       = string
    enable_message_ordering      = string
    service_account              = string
    enable_exactly_once_delivery = string
    subscription_labels          = map(string)
  }))
  description = "The list of the pull subscriptions."
  default = [{
    name                         = null
    ack_deadline_seconds         = null
    dead_letter_topic            = null
    max_delivery_attempts        = null
    maximum_backoff              = null
    minimum_backoff              = null
    filter                       = null
    enable_message_ordering      = null
    service_account              = null
    enable_exactly_once_delivery = null
  subscription_labels = null }]
}

variable "topic_message_retention_duration" {
  type        = string
  description = "The minimum duration in seconds to retain a message after it is published to the topic."
  default     = null
}

variable "message_storage_policy" {
  type        = map(any)
  description = "A map of storage policies. Default - inherit from organization's Resource Location Restriction policy."
  default     = {}
}

variable "topic_kms_key_name" {
  type        = string
  description = "The resource name of the Cloud KMS CryptoKey to be used to protect access to messages published on this topic."
  default     = null
}

variable "grant_token_creator" {
  type        = bool
  description = "Specify true if you want to add token creator role to the default Pub/Sub SA."
  default     = true
}

variable "schema" {
  type = object({
    name       = string
    type       = string
    definition = string
    encoding   = string
  })
  description = "Schema for the topic."
  default     = null
}
