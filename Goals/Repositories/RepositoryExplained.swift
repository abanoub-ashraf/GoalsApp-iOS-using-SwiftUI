//
//  RepositoryExplained.swift
//  Goals
//
//  Created by Abanoub Ashraf on 20/11/2023.
//

import Foundation

struct Boook {
    let id: Int
    var title: String
    let author: String
}

protocol BookRepository {
    func getAllBooks() -> [Boook]
    func getBookById(_ id: Int) -> Boook?
    func addBook(_ book: Boook)
    func updateBook(_ book: Boook)
    func deleteBook(_ id: Int)
}

class InMemoryBookRepository: BookRepository {
    private var books: [Boook] = []
    
    func getAllBooks() -> [Boook] {
        return self.books
    }
    
    func getBookById(_ id: Int) -> Boook? {
        return books.first { $0.id == id }
    }
    
    func addBook(_ book: Boook) {
        self.books.append(book)
    }
    
    func updateBook(_ book: Boook) {
        if let index = self.books.firstIndex(where: { $0.id == book.id }) {
            self.books[index] = book
        }
    }
    
    func deleteBook(_ id: Int) {
        self.books.removeAll { $0.id == id }
    }
}

struct UseBookRepository {
    static func runSample(bookRepository: BookRepository) {
        let bookRepository: BookRepository = bookRepository
        
        let book1 = Boook(id: 1, title: "Mastering Widgitkit", author: "DevTechie")
        let book2 = Boook(id: 2, title: "Mastering SwiftUI", author: "DevTechie")
        
        bookRepository.addBook(book1)
        bookRepository.addBook(book2)
        
        let allBooks = bookRepository.getAllBooks()
        print(allBooks)
        
        if let bookId = bookRepository.getBookById(1) {
            print(bookId)
        }
        
        if var existingBook = bookRepository.getBookById(1) {
            existingBook.title = "Mastering Widgitkit in iOS 17"
            bookRepository.updateBook(existingBook)
        }
        
        bookRepository.deleteBook(2)
        
        let updatedBooks = bookRepository.getAllBooks()
        print(updatedBooks)
    }
}
