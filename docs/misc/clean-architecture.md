# Thought on Clean Architecture

## Layered architecture

- What is Layered Architecture?
- Advantages
    - Simple, commonly used
- Challenges
    - Chances of becoming tangled mess
    - Not very explicit about code intention

## Clean Architecture

- What is Clean Architecture?
- Advantages
    - More maintainable in the long run
    - Ability to switch frameworks without changing core domain
- Challenges
    - More code to write and maintain
    - May not use frameworks features in easier way

## Questions to ask ourselves

- Is clean architecture suitable for all type of applications?
- Is your application has heavy business logic?
- How many types of clients your application have?
- Do we need Framework independence?

## My preferred approach (middle ground)

- Package-by-feature instead of Package-by-layer
- Explicit configuration or framework magic
- Use-cases vs Services
- Domain model vs database model
- Domain logic vs Business rules
- Database entities and DTOs

## References

- http://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html
- https://medium.freecodecamp.org/a-quick-introduction-to-clean-architecture-990c014448d2
- https://www.oreilly.com/ideas/software-architecture-patterns/page/2/layered-architecture
- https://towardsdatascience.com/software-architecture-patterns-98043af8028
- https://gist.github.com/ygrenzinger/14812a56b9221c9feca0b3621518635b
