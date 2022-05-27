{- |
   Module      : Text.Pandoc.Parsing
   Copyright   : Copyright (C) 2006-2022 John MacFarlane
   License     : GNU GPL, version 2 or above

   Maintainer  : John MacFarlane <jgm@berkeley.edu>
   Stability   : alpha
   Portability : portable

A utility library with parsers used in pandoc readers.
-}

module Text.Pandoc.Parsing ( module Text.Pandoc.Sources,
                             countChar,
                             textStr,
                             anyLine,
                             anyLineNewline,
                             indentWith,
                             manyChar,
                             many1Char,
                             manyTillChar,
                             many1TillChar,
                             many1Till,
                             manyUntil,
                             manyUntilChar,
                             sepBy1',
                             notFollowedBy',
                             oneOfStrings,
                             oneOfStringsCI,
                             spaceChar,
                             nonspaceChar,
                             skipSpaces,
                             blankline,
                             blanklines,
                             gobbleSpaces,
                             gobbleAtMostSpaces,
                             enclosed,
                             stringAnyCase,
                             parseFromString,
                             parseFromString',
                             lineClump,
                             charsInBalanced,
                             romanNumeral,
                             emailAddress,
                             uri,
                             mathInline,
                             mathDisplay,
                             withHorizDisplacement,
                             withRaw,
                             escaped,
                             characterReference,
                             upperRoman,
                             lowerRoman,
                             decimal,
                             lowerAlpha,
                             upperAlpha,
                             anyOrderedListMarker,
                             orderedListMarker,
                             charRef,
                             lineBlockLines,
                             tableWith,
                             tableWith',
                             widthsFromIndices,
                             gridTableWith,
                             gridTableWith',
                             TableComponents (..),
                             TableNormalization (..),
                             toTableComponents,
                             toTableComponents',
                             readWith,
                             readWithM,
                             testStringWith,
                             guardEnabled,
                             guardDisabled,
                             updateLastStrPos,
                             notAfterString,
                             logMessage,
                             reportLogMessages,
                             ParserState (..),
                             HasReaderOptions (..),
                             HasIdentifierList (..),
                             HasMacros (..),
                             HasLogMessages (..),
                             HasLastStrPosition (..),
                             HasIncludeFiles (..),
                             defaultParserState,
                             HeaderType (..),
                             ParserContext (..),
                             QuoteContext (..),
                             HasQuoteContext (..),
                             NoteTable,
                             NoteTable',
                             KeyTable,
                             SubstTable,
                             Key (..),
                             toKey,
                             registerHeader,
                             smartPunctuation,
                             singleQuoteStart,
                             singleQuoteEnd,
                             doubleQuoteStart,
                             doubleQuoteEnd,
                             apostrophe,
                             doubleCloseQuote,
                             ellipses,
                             dash,
                             nested,
                             citeKey,
                             Parser,
                             ParserT,
                             Future(..),
                             runF,
                             askF,
                             asksF,
                             returnF,
                             trimInlinesF,
                             token,
                             (<+?>),
                             extractIdClass,
                             insertIncludedFile,
                             -- * Re-exports from Text.Parsec
                             Stream,
                             runParser,
                             runParserT,
                             parse,
                             tokenPrim,
                             anyToken,
                             getInput,
                             setInput,
                             unexpected,
                             skipMany,
                             skipMany1,
                             count,
                             eof,
                             lookAhead,
                             notFollowedBy,
                             many,
                             many1,
                             manyTill,
                             (<|>),
                             (<?>),
                             choice,
                             try,
                             sepBy,
                             sepBy1,
                             sepEndBy,
                             sepEndBy1,
                             endBy,
                             endBy1,
                             option,
                             optional,
                             optionMaybe,
                             getState,
                             setState,
                             updateState,
                             SourcePos,
                             getPosition,
                             setPosition,
                             sourceName,
                             setSourceName,
                             sourceColumn,
                             sourceLine,
                             setSourceColumn,
                             setSourceLine,
                             incSourceColumn,
                             incSourceLine,
                             newPos,
                             initialPos,
                             Line,
                             Column,
                             ParseError
                             )
where

import Text.Pandoc.Sources
import Text.Parsec
    ( setSourceName,
      Column,
      Line,
      incSourceLine,
      incSourceColumn,
      setSourceLine,
      setSourceColumn,
      sourceLine,
      sourceColumn,
      sourceName,
      setSourceName,
      setPosition,
      getPosition,
      updateState,
      setState,
      getState,
      optionMaybe,
      optional,
      option,
      endBy1,
      endBy,
      sepEndBy1,
      sepEndBy,
      sepBy1,
      sepBy,
      try,
      choice,
      (<?>),
      (<|>),
      manyTill,
      many1,
      many,
      notFollowedBy,
      lookAhead,
      eof,
      count,
      skipMany1,
      skipMany,
      unexpected,
      setInput,
      getInput,
      anyToken,
      tokenPrim,
      parse,
      runParserT,
      runParser,
      ParseError,
      SourcePos,
      Stream(..) )
import Text.Parsec.Pos (initialPos, newPos)
import Text.Pandoc.Parsing.Capabilities
    ( guardDisabled,
      guardEnabled,
      logMessage,
      notAfterString,
      reportLogMessages,
      updateLastStrPos,
      HasIdentifierList(..),
      HasIncludeFiles(..),
      HasLastStrPosition(..),
      HasLogMessages(..),
      HasMacros(..),
      HasQuoteContext(..),
      HasReaderOptions(..),
      QuoteContext(..) )
import Text.Pandoc.Parsing.Citations ( citeKey )
import Text.Pandoc.Parsing.General
    ( readWithM,
      (<+?>),
      anyLine,
      anyLineNewline,
      blankline,
      blanklines,
      charRef,
      characterReference,
      charsInBalanced,
      countChar,
      emailAddress,
      enclosed,
      escaped,
      extractIdClass,
      gobbleAtMostSpaces,
      gobbleSpaces,
      indentWith,
      insertIncludedFile,
      lineBlockLines,
      lineClump,
      many1Char,
      many1Till,
      many1TillChar,
      manyChar,
      manyTillChar,
      manyUntil,
      manyUntilChar,
      nested,
      nonspaceChar,
      notFollowedBy',
      oneOfStrings,
      oneOfStringsCI,
      parseFromString,
      parseFromString',
      readWith,
      registerHeader,
      sepBy1',
      skipSpaces,
      spaceChar,
      stringAnyCase,
      testStringWith,
      textStr,
      token,
      trimInlinesF,
      uri,
      withHorizDisplacement,
      withRaw )
import Text.Pandoc.Parsing.GridTable
    ( gridTableWith,
      gridTableWith',
      tableWith,
      tableWith',
      toTableComponents,
      toTableComponents',
      widthsFromIndices,
      TableComponents(..),
      TableNormalization(..) )
import Text.Pandoc.Parsing.Lists
    ( anyOrderedListMarker,
      decimal,
      lowerAlpha,
      lowerRoman,
      orderedListMarker,
      romanNumeral,
      upperAlpha,
      upperRoman )
import Text.Pandoc.Parsing.Math ( mathDisplay, mathInline )
import Text.Pandoc.Parsing.Smart
    ( apostrophe,
      dash,
      doubleCloseQuote,
      doubleQuoteEnd,
      doubleQuoteStart,
      ellipses,
      singleQuoteEnd,
      singleQuoteStart,
      smartPunctuation )
import Text.Pandoc.Parsing.State
    ( defaultParserState,
      toKey,
      HeaderType(..),
      Key(..),
      KeyTable,
      NoteTable,
      NoteTable',
      ParserContext(..),
      ParserState(..),
      SubstTable )
import Text.Pandoc.Parsing.Types
    ( ParserT, askF, asksF, returnF, runF, Future(..), Parser )