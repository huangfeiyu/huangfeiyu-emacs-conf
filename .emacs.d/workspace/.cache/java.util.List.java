 // Source code is unavailable, and was generated by the Fernflower decompiler.
package java.util;

import java.util.AbstractList.RandomAccessSpliterator;
import java.util.ImmutableCollections.List12;
import java.util.ImmutableCollections.ListN;
import java.util.function.UnaryOperator;

public interface List<E> extends Collection<E> {
   int size();

   boolean isEmpty();

   boolean contains(Object var1);

   Iterator<E> iterator();

   Object[] toArray();

   <T> T[] toArray(T[] var1);

   boolean add(E var1);

   boolean remove(Object var1);

   boolean containsAll(Collection<?> var1);

   boolean addAll(Collection<? extends E> var1);

   boolean addAll(int var1, Collection<? extends E> var2);

   boolean removeAll(Collection<?> var1);

   boolean retainAll(Collection<?> var1);

   default void replaceAll(UnaryOperator<E> operator) {
      Objects.requireNonNull(operator);
      ListIterator li = this.listIterator();

      while(li.hasNext()) {
         li.set(operator.apply(li.next()));
      }

   }

   default void sort(Comparator<? super E> c) {
      Object[] a = this.toArray();
      Arrays.sort(a, c);
      ListIterator<E> i = this.listIterator();
      Object[] var4 = a;
      int var5 = a.length;

      for(int var6 = 0; var6 < var5; ++var6) {
         Object e = var4[var6];
         i.next();
         i.set(e);
      }

   }

   void clear();

   boolean equals(Object var1);

   int hashCode();

   E get(int var1);

   E set(int var1, E var2);

   void add(int var1, E var2);

   E remove(int var1);

   int indexOf(Object var1);

   int lastIndexOf(Object var1);

   ListIterator<E> listIterator();

   ListIterator<E> listIterator(int var1);

   List<E> subList(int var1, int var2);

   default Spliterator<E> spliterator() {
      return (Spliterator)(this instanceof RandomAccess ? new RandomAccessSpliterator(this) : Spliterators.spliterator(this, 16));
   }

   static <E> List<E> of() {
      return ImmutableCollections.emptyList();
   }

   static <E> List<E> of(E e1) {
      return new List12(e1);
   }

   static <E> List<E> of(E e1, E e2) {
      return new List12(e1, e2);
   }

   static <E> List<E> of(E e1, E e2, E e3) {
      return new ListN(new Object[]{e1, e2, e3});
   }

   static <E> List<E> of(E e1, E e2, E e3, E e4) {
      return new ListN(new Object[]{e1, e2, e3, e4});
   }

   static <E> List<E> of(E e1, E e2, E e3, E e4, E e5) {
      return new ListN(new Object[]{e1, e2, e3, e4, e5});
   }

   static <E> List<E> of(E e1, E e2, E e3, E e4, E e5, E e6) {
      return new ListN(new Object[]{e1, e2, e3, e4, e5, e6});
   }

   static <E> List<E> of(E e1, E e2, E e3, E e4, E e5, E e6, E e7) {
      return new ListN(new Object[]{e1, e2, e3, e4, e5, e6, e7});
   }

   static <E> List<E> of(E e1, E e2, E e3, E e4, E e5, E e6, E e7, E e8) {
      return new ListN(new Object[]{e1, e2, e3, e4, e5, e6, e7, e8});
   }

   static <E> List<E> of(E e1, E e2, E e3, E e4, E e5, E e6, E e7, E e8, E e9) {
      return new ListN(new Object[]{e1, e2, e3, e4, e5, e6, e7, e8, e9});
   }

   static <E> List<E> of(E e1, E e2, E e3, E e4, E e5, E e6, E e7, E e8, E e9, E e10) {
      return new ListN(new Object[]{e1, e2, e3, e4, e5, e6, e7, e8, e9, e10});
   }

   @SafeVarargs
   static <E> List<E> of(E... elements) {
      switch(elements.length) {
      case 0:
         return ImmutableCollections.emptyList();
      case 1:
         return new List12(elements[0]);
      case 2:
         return new List12(elements[0], elements[1]);
      default:
         return new ListN(elements);
      }
   }

   static <E> List<E> copyOf(Collection<? extends E> coll) {
      return ImmutableCollections.listCopy(coll);
   }
}
