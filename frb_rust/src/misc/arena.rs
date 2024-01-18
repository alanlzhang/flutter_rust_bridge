use std::any::Any;
use std::cell::RefCell;

// ref: (1) "scoped" things (e.g. scoped-threads) (2) "arena" things (e.g. typed_arena and many others)
pub struct Arena {
    values: RefCell<Vec<Box<dyn Any>>>,
}

impl Default for Arena {
    fn default() -> Self {
        Self {
            values: RefCell::new(vec![]),
        }
    }
}

impl Arena {
    pub fn put<T: 'static>(&mut self, value: T) -> &mut T {
        self.values.borrow_mut().push(Box::new(value));
        self.values
            .borrow_mut()
            .last_mut()
            .unwrap()
            .downcast_mut()
            .unwrap()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::path::PathBuf;

    #[test]
    fn test_simple() {
        let mut arena = Arena::default();
        let apple = arena.put("Apple".to_owned());
        let orange = arena.put(PathBuf::new());
        assert_eq!(apple, "Apple");
        drop(arena);
    }
}
