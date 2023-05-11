#ifndef COHERENT_HASHING_TREE_H
#define COHERENT_HASHING_TREE_H

#include "../Logger.h"

namespace Tree
template <typename T, typename functor>
class Tree {
public:
    typedef unsigned int dim_type;
    typedef T data_type;
    typedef functor functor_type;

private:
    struct Node{
        Node(){
            value = 0;
            left = nullptr;
            right = nullptr;
        }

        explicit Node(const data_type *val){
            value = val;
            left = nullptr;
            right = nullptr;
        }

        ~Node(){
            value = 0;
            delete left;
            left = nullptr;
            delete right;
            right = nullptr;
        }

        data_type value;
        Node *left, *right;
    };


public:

    Tree(){
        _root = nullptr;
        _dimension = 0;
    }

    ~Tree(){
        delete _root;
        _root = nullptr;
    }

    void add(const data_type *value){
        Node *i = _root;
        Node *parent;
        Node *newNode = new Node(value);
        bool right;

//        Logger::notice(std::string("Inserting ")
//                       + std::to_string(newNode->value)
//                       + std::string(" in the tree"));

        if(_dimension == 0){
            _root = newNode;
            _dimension++;
            return;
        }

        while(i != nullptr){
            right = false; parent = i;

            if(_functor(value, i->value)){
                i = i->right;
                right = true;
            }
            else{
                i = i->left;
            }
        }

        if(right){
            parent->right = newNode;
        }
        else{
            parent->left = newNode;
        }
        _dimension++;
    }

    void inOrderVisit() const {
        inOrderVisit(_root);
    }

    void inOrderVisit(Node *node) const {
        if(node == nullptr){
            return;
        }
        inOrderVisit(node->left);
        Logger::notice(std::string("Value >> ")
                       + std::to_string(node->value));
        inOrderVisit(node->right);
    }

    Node *search(const data_type &value) const {
        Node *node = _root;

        while(node != nullptr){
            if(_functor(node->value, value)){
                node = node->left;
            }
            else if(_functor(node->value, value)){
                node = node->right;
            }
            else{
                return node;
            }
        }
        return nullptr;
    }

protected:

    Node *_root;
    dim_type _dimension;
    functor_type _functor;
};

#endif
