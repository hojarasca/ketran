import { useEffect } from 'react'
import { useDispatch } from 'react-redux'
import Link from 'next/link'
import { startClock } from '../actions'
import Examples from '../components/examples'

const Index = () => {
  const dispatch = useDispatch()
  useEffect(() => {
    dispatch(startClock())
  }, [dispatch])

  return (
    <>
      <h1>Miguel Duarte Capstone project.</h1>
      <Examples />
      <Link href='/show-redux-state'>
        <a>Click to see current Redux State</a>
      </Link>
    </>
  )
}

export default Index
