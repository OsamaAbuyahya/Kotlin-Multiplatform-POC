package com.example.kmpprojectpoc.android.home

import androidx.compose.runtime.MutableState
import androidx.compose.runtime.State
import androidx.compose.runtime.mutableStateOf
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.example.kmpprojectpoc.ProductsApi
import com.example.kmpprojectpoc.RequestState
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch

class HomeViewModel : ViewModel() {
    private var _requestState: MutableState<RequestState> = mutableStateOf(RequestState.Idle)
    val requestState: State<RequestState> = _requestState

    init {
        getProducts()
    }

    private fun getProducts() {
        viewModelScope.launch(Dispatchers.IO) {
            ProductsApi().fetchProducts(10).collectLatest {
                _requestState.value = it
            }
        }
    }

}