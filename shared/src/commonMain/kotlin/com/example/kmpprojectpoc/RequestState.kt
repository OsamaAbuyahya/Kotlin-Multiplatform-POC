package com.example.kmpprojectpoc

import kotlinx.serialization.Serializable

@Serializable
sealed class RequestState {

    @Serializable
    data object Idle: RequestState()

    @Serializable
    data object Loading: RequestState()

    @Serializable
    data class Success(val data: Products): RequestState()

    @Serializable
    data class Error(val message: String): RequestState()

    fun isLoading() = this is Loading

    fun isSuccess() = this is Success

    fun isError() = this is Error

    fun getProducts(): Products = Products(
        items = (this as Success).data.items
    )

    fun getErrorMessage(): String = (this as Error).message
}