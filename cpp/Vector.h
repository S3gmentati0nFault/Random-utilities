#ifndef COHERENT_HASHING_VECTOR_H
#define COHERENT_HASHING_VECTOR_H

#include "../Logger.h"

template <typename T>
class Vector {
public:
    typedef T data_type;
    typedef unsigned int dim_type;

    Vector() : _size(0) {}

    explicit Vector(const dim_type size) {
        try{
            _vector = new data_type[size];
            _size = size;
        }
        catch(...){
            Logger::error("There was a problem while instantiating the necessary memory");
            _vector = nullptr;
            _size = 0;
        }
    }

    Vector(const Vector &other){
        try{
            _vector = new data_type[other._size];
            for(int i = 0; i < other._size; ++i){
                _vector[i] = other._vector[i];
            }
            _size = other._size;
        }
        catch(...){
            Logger::error("There was a problem while instantiating the necessary memory");
            _vector = nullptr;
            _size = 0;
        }
    }

    ~Vector(){
        delete[] _vector;
        _vector = nullptr;
        _size = 0;
    }

    Vector &operator=(const Vector &other){
        if(this != other){
            try {
                Vector *tmp(other);
                return tmp;
            }
        }
        else{
            return *this;
        }
    }

    data_type &operator[](const dim_type i) const {
        return _vector[i];
    }

    dim_type size() const {
        return _size;
    }

    void fisherYatesShuffle(){}

private:
    data_type *_vector;
    dim_type _size;
};

#endif