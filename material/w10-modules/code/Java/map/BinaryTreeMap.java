package map;
// Define a generic class BinaryTreeMap<K,V> that implements Map<K,V> with a binary tree

// In Ocaml, we would write:
/*
  open LibPrintable
  open LibOrderedPrintable
  open LibMap
  
  module BinaryTreeMap =
  functor
    (K : OrderedPrintable)
    (V : Printable)
    ->
    struct
      type key = K.t
      type value = V.t
      type t = Empty | Node of key * value * t * t
  
      let empty = Empty
  
      let rec to_list = function
        | Empty -> []
        | Node (k, v, l, r) -> to_list l @ ((k, v) :: to_list r)
  
      let rec set k v = function
        | Empty -> Node (k, v, Empty, Empty)
        | Node (k', v', l, r) ->
            let diff = K.compare k k' in
            if diff < 0 then Node (k', v', set k v l, r)
            else if diff > 0 then Node (k', v', l, set k v r)
            else Node (k', v, l, r)
  
      let rec get_opt k = function
        | Empty -> None
        | Node (k', v, l, r) ->
            let diff = K.compare k k' in
            if diff < 0 then get_opt k l
            else if diff > 0 then get_opt k r
            else Some v
  
      let get k m =
        Option.fold
          ~none:(fun _ -> raise Not_found)
          ~some:(fun x _ -> x)
          (get_opt k m) ()
  
      let to_string m =
        List.map
          (fun (k, v) -> K.to_string k ^ " -> " ^ V.to_string v)
          (to_list m)
        |> String.concat ", "
        |> fun s -> "{ " ^ s ^ " }" (* Printf.sprintf "{ %s }" *)
    end
 */

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class BinaryTreeMap<K extends OrderedPrintable, V extends Printable> implements Map<K, V> {

    class t {
        K key;
        V value;
        t left;
        t right;

        t(K key, V value, t left, t right) {
            this.key = key;
            this.value = value;
            this.left = left;
            this.right = right;
        }
    }

    t root = null;

    @Override
    public V get(K key) {
        return get_opt(key).orElseThrow(() -> new RuntimeException("Key not found"));
    }

    @Override
    public void set(K key, V value) {
        root = setNode(root, key, value);
    }

    @Override
    public Optional<V> get_opt(K key) {
        return findOptNode(root, key).map(n -> n.value);
    }

    @Override
    public String to_string() {
        var res = toList().stream()
                .map(p -> p.first.to_string(p.first.getT()) + " -> " + p.second.to_string(p.second.getT()))
                .collect(Collectors.joining(", "));

        return "{ " + res + " }";
    }

    @Override
    public List<Pair<K, V>> toList() {
        return createList(root);
    }

    //
    // Helper methods
    //
    private Optional<t> findOptNode(t root, K key) {
        if (root == null) {
            return Optional.empty();
        }
        int diff = key.compare(key.getT(), root.key.getT());
        if (diff < 0) {
            return findOptNode(root.left, key);
        } else if (diff > 0) {
            return findOptNode(root.right, key);
        } else {
            return Optional.of(root);
        }
    }

    private t setNode(t node, K key, V value) {
        if (node == null) {
            return new t(key, value, null, null);
        }

        int cmp = key.compare(key.getT(), node.key.getT());
        if (cmp < 0) {
            node.left = setNode(node.left, key, value);
        } else if (cmp > 0) {
            node.right = setNode(node.right, key, value);
        } else {
            node.value = value;
        }

        return node;
    }

    private List<Pair<K, V>> createList(t node) {
        if (node == null) {
            return List.of();
        }

        var left = createList(node.left);
        var right = createList(node.right);

        return Stream
                .concat(left.stream(), Stream.concat(Stream.of(new Pair<K, V>(node.key, node.value)), right.stream()))
                .collect(Collectors.toList());
    }

}